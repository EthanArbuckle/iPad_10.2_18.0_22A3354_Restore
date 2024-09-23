@implementation SXTextTangierFlowInfo

- (SXTextTangierFlowInfo)initWithStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  SXTextTangierFlowInfo *v9;
  SXTextTangierFlowInfo *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SXTextTangierFlowInfo;
  v9 = -[SXTextTangierFlowInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    v10->_range.location = location;
    v10->_range.length = length;
  }

  return v10;
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
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (BOOL)hasSpeakableContent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (!hasSpeakableContent_speakableCharacterSet)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1690]);
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formUnionWithCharacterSet:", v4);

    objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formUnionWithCharacterSet:", v5);

    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formUnionWithCharacterSet:", v6);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 65532);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCharactersInString:", v7);

    v8 = objc_msgSend(v3, "copy");
    v9 = (void *)hasSpeakableContent_speakableCharacterSet;
    hasSpeakableContent_speakableCharacterSet = v8;

  }
  -[SXTextTangierFlowInfo storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SXTextTangierFlowInfo range](self, "range");
  objc_msgSend(v11, "substringWithRange:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v14, "rangeOfCharacterFromSet:", hasSpeakableContent_speakableCharacterSet) != 0x7FFFFFFFFFFFFFFFLL;
  return (char)v10;
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

- (SXTextTangierFlowStorage)storage
{
  return self->_storage;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (TSDRepDirectLayerHosting)directLayerHost
{
  return (TSDRepDirectLayerHosting *)objc_loadWeakRetained((id *)&self->_directLayerHost);
}

- (void)setDirectLayerHost:(id)a3
{
  objc_storeWeak((id *)&self->_directLayerHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directLayerHost);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->geometry, 0);
}

@end
