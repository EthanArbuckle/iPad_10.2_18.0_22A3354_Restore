@implementation THModelBodyTextInfo

- (BOOL)autosizes
{
  return self->mAutosizes;
}

- (void)setAutosizes:(BOOL)a3
{
  -[THModelBodyTextInfo willModify](self, "willModify");
  self->mAutosizes = a3;
}

- (TSWPColumnStyle)columnStyle
{
  return self->mColumnStyle;
}

- (void)setColumnStyle:(id)a3
{
  id v5;

  -[THModelBodyTextInfo willModify](self, "willModify");
  v5 = a3;

  self->mColumnStyle = (TSWPColumnStyle *)a3;
}

- (TSWPLineHintCollection)lineHints
{
  return self->mLineHints;
}

- (void)setLineHints:(id)a3
{
  id v5;

  -[THModelBodyTextInfo willModify](self, "willModify");
  v5 = a3;

  self->mLineHints = (TSWPLineHintCollection *)a3;
}

- (THWPStorage)bodyStorage
{
  return (THWPStorage *)objc_msgSend(-[THModelBodyTextInfo parentInfo](self, "parentInfo"), "bodyStorage");
}

- (void)dealloc
{
  objc_super v3;

  self->mColumnStyle = 0;
  self->mLineHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelBodyTextInfo;
  -[THModelBodyTextInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THBodyLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THBodyRep, a2);
}

@end
