@implementation NCMutableNotificationContent

- (void)setContentType:(id)a3
{
  NSString *v4;
  NSString *contentType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentType = self->super._contentType;
  self->super._contentType = v4;

}

- (void)setCustomHeader:(id)a3
{
  NSString *v4;
  NSString *customHeader;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  customHeader = self->super._customHeader;
  self->super._customHeader = v4;

}

- (void)setDefaultHeader:(id)a3
{
  NSString *v4;
  NSString *defaultHeader;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  defaultHeader = self->super._defaultHeader;
  self->super._defaultHeader = v4;

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->super._title;
  self->super._title = v4;

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->super._subtitle;
  self->super._subtitle = v4;

}

- (void)setMessage:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedMessage;

  objc_msgSend(MEMORY[0x24BDD1458], "nc_safeAttributedStringWithString:", a3);
  v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  attributedMessage = self->super._attributedMessage;
  self->super._attributedMessage = v4;

}

- (NSString)message
{
  return -[NSAttributedString string](self->super._attributedMessage, "string");
}

- (void)setAttributedMessage:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedMessage;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  attributedMessage = self->super._attributedMessage;
  self->super._attributedMessage = v4;

}

- (void)setSummary:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *summary;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  summary = self->super._summary;
  self->super._summary = v4;

}

- (void)setThreadSummary:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *threadSummary;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  threadSummary = self->super._threadSummary;
  self->super._threadSummary = v4;

}

- (void)setSpotlightIdentifier:(id)a3
{
  NSString *v4;
  NSString *spotlightIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  spotlightIdentifier = self->super._spotlightIdentifier;
  self->super._spotlightIdentifier = v4;

}

- (void)setFooter:(id)a3
{
  NSString *v4;
  NSString *footer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footer = self->super._footer;
  self->super._footer = v4;

}

- (void)setHiddenPreviewsBodyPlaceholder:(id)a3
{
  NSString *v4;
  NSString *hiddenPreviewsBodyPlaceholder;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  hiddenPreviewsBodyPlaceholder = self->super._hiddenPreviewsBodyPlaceholder;
  self->super._hiddenPreviewsBodyPlaceholder = v4;

}

- (void)setCategorySummaryFormat:(id)a3
{
  NSString *v4;
  NSString *categorySummaryFormat;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  categorySummaryFormat = self->super._categorySummaryFormat;
  self->super._categorySummaryFormat = v4;

}

- (void)setCommunicationContext:(id)a3
{
  _UNNotificationCommunicationContext *v4;
  _UNNotificationCommunicationContext *communicationContext;

  v4 = (_UNNotificationCommunicationContext *)objc_msgSend(a3, "copy");
  communicationContext = self->super._communicationContext;
  self->super._communicationContext = v4;

}

- (void)setIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCMutableNotificationContent setIcons:](self, "setIcons:", v7);

  }
  else
  {
    -[NCMutableNotificationContent setIcons:](self, "setIcons:", 0);
  }

}

- (void)setIcons:(id)a3
{
  objc_storeStrong((id *)&self->super._icons, a3);
}

- (void)setCarPlayIcons:(id)a3
{
  objc_storeStrong((id *)&self->super._carPlayIcons, a3);
}

- (void)setFullScreenIcons:(id)a3
{
  objc_storeStrong((id *)&self->super._fullScreenIcons, a3);
}

- (void)setAttachmentImage:(id)a3
{
  objc_storeStrong((id *)&self->super._attachmentImage, a3);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->super._date, a3);
}

- (void)setDateAllDay:(BOOL)a3
{
  self->super._dateAllDay = a3;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->super._timeZone, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NCNotificationContent initWithNotificationContent:]([NCNotificationContent alloc], "initWithNotificationContent:", self);
}

- (void)setSummaryArgument:(id)a3
{
  NSString *v4;
  NSString *summaryArgument;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  summaryArgument = self->super._summaryArgument;
  self->super._summaryArgument = v4;

}

- (void)setSummaryArgumentCount:(unint64_t)a3
{
  self->super._summaryArgumentCount = a3;
}

@end
