@implementation NCNotificationContent

- (NCNotificationContent)initWithNotificationContent:(id)a3
{
  id v4;
  NCNotificationContent *v5;
  void *v6;
  uint64_t v7;
  NSString *contentType;
  void *v9;
  uint64_t v10;
  NSString *customHeader;
  void *v12;
  uint64_t v13;
  NSString *defaultHeader;
  void *v15;
  uint64_t v16;
  NSString *title;
  void *v18;
  uint64_t v19;
  NSString *subtitle;
  void *v21;
  uint64_t v22;
  NSAttributedString *attributedMessage;
  void *v24;
  uint64_t v25;
  NSAttributedString *summary;
  void *v27;
  uint64_t v28;
  NSAttributedString *threadSummary;
  void *v30;
  uint64_t v31;
  NSString *spotlightIdentifier;
  void *v33;
  uint64_t v34;
  NSString *footer;
  void *v36;
  uint64_t v37;
  NSString *hiddenPreviewsBodyPlaceholder;
  void *v39;
  uint64_t v40;
  NSString *categorySummaryFormat;
  void *v42;
  uint64_t v43;
  _UNNotificationCommunicationContext *communicationContext;
  uint64_t v45;
  NSArray *icons;
  uint64_t v47;
  NSArray *carPlayIcons;
  uint64_t v49;
  NSArray *fullScreenIcons;
  uint64_t v51;
  UIImage *attachmentImage;
  uint64_t v53;
  NSDate *date;
  uint64_t v55;
  NSTimeZone *timeZone;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)NCNotificationContent;
  v5 = -[NCNotificationContent init](&v58, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v7;

    objc_msgSend(v4, "customHeader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    customHeader = v5->_customHeader;
    v5->_customHeader = (NSString *)v10;

    objc_msgSend(v4, "defaultHeader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    defaultHeader = v5->_defaultHeader;
    v5->_defaultHeader = (NSString *)v13;

    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v16;

    objc_msgSend(v4, "subtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v19;

    objc_msgSend(v4, "attributedMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    attributedMessage = v5->_attributedMessage;
    v5->_attributedMessage = (NSAttributedString *)v22;

    objc_msgSend(v4, "summary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    summary = v5->_summary;
    v5->_summary = (NSAttributedString *)v25;

    objc_msgSend(v4, "threadSummary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    threadSummary = v5->_threadSummary;
    v5->_threadSummary = (NSAttributedString *)v28;

    objc_msgSend(v4, "spotlightIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    spotlightIdentifier = v5->_spotlightIdentifier;
    v5->_spotlightIdentifier = (NSString *)v31;

    objc_msgSend(v4, "footer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    footer = v5->_footer;
    v5->_footer = (NSString *)v34;

    objc_msgSend(v4, "hiddenPreviewsBodyPlaceholder");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    hiddenPreviewsBodyPlaceholder = v5->_hiddenPreviewsBodyPlaceholder;
    v5->_hiddenPreviewsBodyPlaceholder = (NSString *)v37;

    objc_msgSend(v4, "categorySummaryFormat");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    categorySummaryFormat = v5->_categorySummaryFormat;
    v5->_categorySummaryFormat = (NSString *)v40;

    objc_msgSend(v4, "communicationContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    communicationContext = v5->_communicationContext;
    v5->_communicationContext = (_UNNotificationCommunicationContext *)v43;

    objc_msgSend(v4, "icons");
    v45 = objc_claimAutoreleasedReturnValue();
    icons = v5->_icons;
    v5->_icons = (NSArray *)v45;

    objc_msgSend(v4, "carPlayIcons");
    v47 = objc_claimAutoreleasedReturnValue();
    carPlayIcons = v5->_carPlayIcons;
    v5->_carPlayIcons = (NSArray *)v47;

    objc_msgSend(v4, "fullScreenIcons");
    v49 = objc_claimAutoreleasedReturnValue();
    fullScreenIcons = v5->_fullScreenIcons;
    v5->_fullScreenIcons = (NSArray *)v49;

    objc_msgSend(v4, "attachmentImage");
    v51 = objc_claimAutoreleasedReturnValue();
    attachmentImage = v5->_attachmentImage;
    v5->_attachmentImage = (UIImage *)v51;

    objc_msgSend(v4, "date");
    v53 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v53;

    v5->_dateAllDay = objc_msgSend(v4, "isDateAllDay");
    objc_msgSend(v4, "timeZone");
    v55 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v55;

  }
  return v5;
}

- (NSString)message
{
  return -[NSAttributedString string](self->_attributedMessage, "string");
}

- (BOOL)isMessagingType
{
  void *v3;
  char v4;
  void *v5;

  -[NCNotificationContent contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF8B08]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[NCNotificationContent contentType](self, "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF8B10]);

  }
  return v4;
}

- (BOOL)isCallType
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[NCNotificationContent contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF8AF8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[NCNotificationContent contentType](self, "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF8B18]) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[NCNotificationContent contentType](self, "contentType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF8B20]) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[NCNotificationContent contentType](self, "contentType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF8AE8]);

      }
    }

  }
  return v4;
}

- (BOOL)isAirDrop
{
  void *v2;
  char v3;

  -[NCNotificationContent contentType](self, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDF8AE0]);

  return v3;
}

- (BOOL)isCommunicationType
{
  return -[NCNotificationContent isMessagingType](self, "isMessagingType")
      || -[NCNotificationContent isCallType](self, "isCallType")
      || -[NCNotificationContent isAirDrop](self, "isAirDrop");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  void *v53;
  char v54;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_22:
      v54 = 0;
      goto LABEL_23;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_22;
  -[NCNotificationContent contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NCIsEqual(v6, v7);

  if (!v8)
    goto LABEL_22;
  -[NCNotificationContent customHeader](self, "customHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = NCIsEqual(v9, v10);

  if (!v11)
    goto LABEL_22;
  -[NCNotificationContent defaultHeader](self, "defaultHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = NCIsEqual(v12, v13);

  if (!v14)
    goto LABEL_22;
  -[NCNotificationContent title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = NCIsEqual(v15, v16);

  if (!v17)
    goto LABEL_22;
  -[NCNotificationContent subtitle](self, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = NCIsEqual(v18, v19);

  if (!v20)
    goto LABEL_22;
  -[NCNotificationContent message](self, "message");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = NCIsEqual(v21, v22);

  if (!v23)
    goto LABEL_22;
  -[NCNotificationContent attributedMessage](self, "attributedMessage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedMessage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = NCIsEqual(v24, v25);

  if (!v26)
    goto LABEL_22;
  -[NCNotificationContent summary](self, "summary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = NCIsEqual(v27, v28);

  if (!v29)
    goto LABEL_22;
  -[NCNotificationContent threadSummary](self, "threadSummary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadSummary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = NCIsEqual(v30, v31);

  if (!v32)
    goto LABEL_22;
  -[NCNotificationContent spotlightIdentifier](self, "spotlightIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spotlightIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = NCIsEqual(v33, v34);

  if (!v35)
    goto LABEL_22;
  -[NCNotificationContent footer](self, "footer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = NCIsEqual(v36, v37);

  if (!v38)
    goto LABEL_22;
  -[NCNotificationContent hiddenPreviewsBodyPlaceholder](self, "hiddenPreviewsBodyPlaceholder");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hiddenPreviewsBodyPlaceholder");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = NCIsEqual(v39, v40);

  if (!v41)
    goto LABEL_22;
  -[NCNotificationContent categorySummaryFormat](self, "categorySummaryFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categorySummaryFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = NCIsEqual(v42, v43);

  if (!v44)
    goto LABEL_22;
  -[NCNotificationContent communicationContext](self, "communicationContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "communicationContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = NCIsEqual(v45, v46);

  if (!v47)
    goto LABEL_22;
  -[NCNotificationContent date](self, "date");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = NCIsEqual(v48, v49);

  if (!v50)
    goto LABEL_22;
  v51 = -[NCNotificationContent isDateAllDay](self, "isDateAllDay");
  if (v51 != objc_msgSend(v5, "isDateAllDay"))
    goto LABEL_22;
  -[NCNotificationContent timeZone](self, "timeZone");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = NCIsEqual(v52, v53);

LABEL_23:
  return v54;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  _BOOL8 dateAllDay;

  v3 = -[NSString hash](self->_contentType, "hash");
  v4 = -[NSString hash](self->_customHeader, "hash") + v3;
  v5 = -[NSString hash](self->_defaultHeader, "hash");
  v6 = v4 + v5 + -[NSString hash](self->_title, "hash");
  v7 = -[NSString hash](self->_subtitle, "hash");
  v8 = v7 + -[NSAttributedString hash](self->_attributedMessage, "hash");
  v9 = v6 + v8 + -[NSAttributedString hash](self->_summary, "hash");
  v10 = -[NSAttributedString hash](self->_threadSummary, "hash");
  v11 = v10 + -[NSString hash](self->_spotlightIdentifier, "hash");
  v12 = v11 + -[NSString hash](self->_footer, "hash");
  v13 = v9 + v12 + -[NSString hash](self->_hiddenPreviewsBodyPlaceholder, "hash");
  v14 = -[NSString hash](self->_categorySummaryFormat, "hash");
  v15 = v14 + -[NSString hash](self->_summaryArgument, "hash") + self->_summaryArgumentCount;
  v16 = v15 + -[_UNNotificationCommunicationContext hash](self->_communicationContext, "hash");
  v17 = v13 + v16 + -[NSDate hash](self->_date, "hash");
  dateAllDay = self->_dateAllDay;
  return v17 + dateAllDay + -[NSTimeZone hash](self->_timeZone, "hash");
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationContent descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NCNotificationContent initWithNotificationContent:]([NCMutableNotificationContent alloc], "initWithNotificationContent:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationContent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationContent *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__NCNotificationContent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __63__NCNotificationContent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("contentType"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "customHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("customHeader"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("defaultHeader"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, CFSTR("title"));

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "appendObject:withName:skipIfNil:", v15, CFSTR("subtitle"), 1);

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("message"));

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attributedMessage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "appendObject:withName:", v21, CFSTR("attributedMessage"));

  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "summary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v23, "appendObject:withName:", v24, CFSTR("summary"));

  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "threadSummary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v26, "appendObject:withName:", v27, CFSTR("threadSummary"));

  v29 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "spotlightIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v29, "appendObject:withName:", v30, CFSTR("spotlightIdentifier"));

  v32 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "footer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v32, "appendObject:withName:", v33, CFSTR("footer"));

  v35 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hiddenPreviewsBodyPlaceholder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v35, "appendObject:withName:", v36, CFSTR("hiddenPreviewsBodyPlaceholder"));

  v38 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "categorySummaryFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v38, "appendObject:withName:", v39, CFSTR("categorySummaryFormat"));

  v41 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "summaryArgument");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)objc_msgSend(v41, "appendObject:withName:", v42, CFSTR("summaryArgument"));

  v44 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "summaryArgumentCount"), CFSTR("summaryArgumentCount"));
  v45 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "communicationContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v45, "appendObject:withName:skipIfNil:", v46, CFSTR("communicationContext"), 1);

  v48 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "icons");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (id)objc_msgSend(v48, "appendObject:withName:", v49, CFSTR("icons"));

  v51 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "carPlayIcons");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (id)objc_msgSend(v51, "appendObject:withName:", v52, CFSTR("carPlayIcons"));

  v54 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fullScreenIcons");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (id)objc_msgSend(v54, "appendObject:withName:", v55, CFSTR("fullScreenIcons"));

  v57 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attachmentImage");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id)objc_msgSend(v57, "appendObject:withName:", v58, CFSTR("attachmentImage"));

  v60 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "date");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (id)objc_msgSend(v60, "appendObject:withName:", v61, CFSTR("date"));

  v63 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDateAllDay"), CFSTR("isDateAllDay"));
  v64 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v65 = (id)objc_msgSend(v64, "appendObject:withName:", v66, CFSTR("timeZone"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationContent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationContent date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("date"));

  return v3;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSString)customHeader
{
  return self->_customHeader;
}

- (NSString)defaultHeader
{
  return self->_defaultHeader;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (NSAttributedString)threadSummary
{
  return self->_threadSummary;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (NSString)footer
{
  return self->_footer;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  return self->_hiddenPreviewsBodyPlaceholder;
}

- (NSString)categorySummaryFormat
{
  return self->_categorySummaryFormat;
}

- (_UNNotificationCommunicationContext)communicationContext
{
  return self->_communicationContext;
}

- (NSArray)icons
{
  return self->_icons;
}

- (NSArray)carPlayIcons
{
  return self->_carPlayIcons;
}

- (NSArray)fullScreenIcons
{
  return self->_fullScreenIcons;
}

- (UIImage)attachmentImage
{
  return self->_attachmentImage;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_attachmentImage, 0);
  objc_storeStrong((id *)&self->_fullScreenIcons, 0);
  objc_storeStrong((id *)&self->_carPlayIcons, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_categorySummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_defaultHeader, 0);
  objc_storeStrong((id *)&self->_customHeader, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (NSString)header
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString length](self->_customHeader, "length");
  v4 = 16;
  if (!v3)
    v4 = 24;
  return (NSString *)*(id *)((char *)&self->super.isa + v4);
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (unint64_t)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

@end
