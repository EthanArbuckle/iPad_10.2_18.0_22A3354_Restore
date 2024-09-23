@implementation ComposePlaceholderViewModel

- (BOOL)shouldUseMultiField
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderViewModel ccRecipients](self, "ccRecipients"));
  v4 = (unint64_t)objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderViewModel bccRecipients](self, "bccRecipients"));
  v6 = v4 | (unint64_t)objc_msgSend(v5, "count");

  return v6 == 0;
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_toRecipients, a3);
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_ccRecipients, a3);
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_bccRecipients, a3);
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderAddress, a3);
}

- (BOOL)showSenderAddress
{
  return self->_showSenderAddress;
}

- (void)setShowSenderAddress:(BOOL)a3
{
  self->_showSenderAddress = a3;
}

- (NSString)htmlContent
{
  return self->_htmlContent;
}

- (void)setHtmlContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
}

@end
