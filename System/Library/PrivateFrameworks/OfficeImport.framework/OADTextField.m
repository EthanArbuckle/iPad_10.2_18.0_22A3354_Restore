@implementation OADTextField

- (OADTextField)init
{
  OADTextField *v2;
  OADParagraphProperties *v3;
  OADParagraphProperties *mParagraphProperties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADTextField;
  v2 = -[OADTextRun init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADParagraphProperties);
    mParagraphProperties = v2->mParagraphProperties;
    v2->mParagraphProperties = v3;

  }
  return v2;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->mText, a3);
}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  -[OADParagraphProperties removeUnnecessaryOverrides](self->mParagraphProperties, "removeUnnecessaryOverrides");
  v3.receiver = self;
  v3.super_class = (Class)OADTextField;
  -[OADTextRun removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
}

- (id)text
{
  return self->mText;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (unint64_t)characterCount
{
  return -[NSString length](self->mText, "length");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
