@implementation TCTaggedMessage

+ (id)taggedMessageWithMessageText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageText:", v4);

  return v5;
}

- (TCTaggedMessage)initWithMessageText:(id)a3
{
  id v4;
  TCTaggedMessage *v5;
  TCTaggedMessage *v6;
  int v7;
  uint64_t v8;
  NSString *mMessageText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TCTaggedMessage;
  v5 = -[TCTaggedMessage init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = -[TCTaggedMessage initWithMessageText:]::currentTag++;
    v5->mMessageTag = v7;
    v8 = objc_msgSend(v4, "copy");
    mMessageText = v6->mMessageText;
    v6->mMessageText = (NSString *)v8;

  }
  return v6;
}

- (int)messageTag
{
  return self->mMessageTag;
}

- (NSString)messageText
{
  return self->mMessageText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessageText, 0);
}

@end
