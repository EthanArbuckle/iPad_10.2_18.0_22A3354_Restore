@implementation THWControlContainer

- (THWControlContainer)initWithDelegate:(id)a3
{
  THWControlContainer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWControlContainer;
  result = -[THWControlContainer init](&v5, "init");
  if (result)
  {
    result->_delegate = (THWControlContainerLayoutDelegate *)a3;
    *(int64x2_t *)&result->_tag = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWControlContainer;
  -[THWControlContainer dealloc](&v3, "dealloc");
}

- (id)childInfos
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWControlContainerLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWControlContainerRep, a2);
}

- (BOOL)isThemeContent
{
  return 0;
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (id)copyWithContext:(id)a3
{
  return 0;
}

- (TSDContainerInfo)parentInfo
{
  return 0;
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isFloatingAboveText
{
  return 1;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  return 0;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (void)setTag:(unint64_t)a3
{
  self->_tag = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (THWControlContainerLayoutDelegate)delegate
{
  return self->_delegate;
}

- (id)instanceData
{
  return self->_instanceData;
}

- (void)setInstanceData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
