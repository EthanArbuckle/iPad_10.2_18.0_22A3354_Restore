@implementation SXStandaloneTextInfo

- (SXStandaloneTextInfo)initWithStorage:(id)a3
{
  id v5;
  SXStandaloneTextInfo *v6;
  SXStandaloneTextInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXStandaloneTextInfo;
  v6 = -[SXStandaloneTextInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    -[TSWPStorage setParentInfo:](v7->_storage, "setParentInfo:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPStorage setParentInfo:](self->_storage, "setParentInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SXStandaloneTextInfo;
  -[SXStandaloneTextInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)anchoredToText
{
  return 0;
}

- (BOOL)attachedToBodyText
{
  return 0;
}

- (BOOL)floatingAboveText
{
  return 0;
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (BOOL)inlineWithText
{
  return 0;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[SXStandaloneTextInfo storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setOwningAttachment:(id)a3
{
  self->owningAttachment = (TSDOwningAttachment *)a3;
}

- (void)setParentInfo:(id)a3
{
  self->parentInfo = (TSDContainerInfo *)a3;
}

- (BOOL)isFloatingAboveText
{
  return self->floatingAboveText;
}

- (BOOL)isAnchoredToText
{
  return self->anchoredToText;
}

- (BOOL)isInlineWithText
{
  return self->inlineWithText;
}

- (BOOL)isAttachedToBodyText
{
  return self->attachedToBodyText;
}

- (SXTextTangierStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->geometry, 0);
}

@end
