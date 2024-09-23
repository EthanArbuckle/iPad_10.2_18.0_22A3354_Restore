@implementation _PSShareSheetSuggestLessFeedback

- (_PSShareSheetSuggestLessFeedback)initWithBundleId:(id)a3 conversationId:(id)a4 handle:(id)a5 contactId:(id)a6
{
  return -[_PSShareSheetSuggestLessFeedback initWithBundleId:conversationId:derivedIntentId:handle:contactId:](self, "initWithBundleId:conversationId:derivedIntentId:handle:contactId:", a3, a4, 0, a5, a6);
}

- (_PSShareSheetSuggestLessFeedback)initWithBundleId:(id)a3 conversationId:(id)a4 derivedIntentId:(id)a5 handle:(id)a6 contactId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _PSShareSheetSuggestLessFeedback *v17;
  uint64_t v18;
  NSString *bundleId;
  uint64_t v20;
  NSString *conversationId;
  uint64_t v22;
  NSString *derivedIntentId;
  uint64_t v24;
  NSString *handle;
  uint64_t v26;
  NSString *contactId;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_PSShareSheetSuggestLessFeedback;
  v17 = -[_PSShareSheetSuggestLessFeedback init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    conversationId = v17->_conversationId;
    v17->_conversationId = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    derivedIntentId = v17->_derivedIntentId;
    v17->_derivedIntentId = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    handle = v17->_handle;
    v17->_handle = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    contactId = v17->_contactId;
    v17->_contactId = (NSString *)v26;

  }
  return v17;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)derivedIntentId
{
  return self->_derivedIntentId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_derivedIntentId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
