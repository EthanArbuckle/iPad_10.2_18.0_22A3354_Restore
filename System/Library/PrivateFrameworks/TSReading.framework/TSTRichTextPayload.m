@implementation TSTRichTextPayload

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (void)setStorage:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mStorage = (TSWPStorage *)a3;
}

- (TSTRichTextPayload)initWithStorage:(id)a3
{
  return -[TSTRichTextPayload initWithContext:storage:](self, "initWithContext:storage:", objc_msgSend(a3, "context"), a3);
}

- (TSTRichTextPayload)initWithContext:(id)a3 storage:(id)a4
{
  TSTRichTextPayload *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTRichTextPayload;
  v5 = -[TSPObject initWithContext:](&v7, sel_initWithContext_, a3);
  if (v5)
    v5->mStorage = (TSWPStorage *)a4;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mStorage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTRichTextPayload;
  -[TSTRichTextPayload dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStorage:", -[TSWPStorage copyWithContext:](-[TSTRichTextPayload storage](self, "storage"), "copyWithContext:", a3));
}

- (id)string
{
  return -[TSWPStorage stringValue](-[TSTRichTextPayload storage](self, "storage"), "stringValue");
}

- (BOOL)requiresRichText
{
  return !-[TSWPStorage canBeStoredInAStringValueCell](-[TSTRichTextPayload storage](self, "storage"), "canBeStoredInAStringValueCell");
}

@end
