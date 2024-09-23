@implementation THGlossaryEntryFloatingInfo

- (THGlossaryEntryFloatingInfo)initWithEntry:(id)a3 body:(id)a4
{
  THGlossaryEntryFloatingInfo *v6;
  THGlossaryEntryFloatingInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THGlossaryEntryFloatingInfo;
  v6 = -[THGlossaryEntryFloatingInfo init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->mEntry = (THModelGlossaryEntry *)a3;
    v6->mBody = (THModelGlossaryEntryFlushable *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->mBody = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryFloatingInfo;
  -[THGlossaryEntryFloatingInfo dealloc](&v3, "dealloc");
}

- (THModelGlossaryEntryBody)body
{
  return -[THModelGlossaryEntryFlushable body](self->mBody, "body");
}

- (NSArray)bodyFloatingInfos
{
  return -[THModelGlossaryEntryBody bodyFloatingInfos](-[THGlossaryEntryFloatingInfo body](self, "body"), "bodyFloatingInfos");
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  return objc_msgSend(-[THGlossaryEntryFloatingInfo childInfos](self, "childInfos"), "objectEnumerator");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithEntry:body:", self->mEntry, self->mBody);
  objc_msgSend(v4, "setParentInfo:", -[THGlossaryEntryFloatingInfo parentInfo](self, "parentInfo"));
  objc_msgSend(v4, "setGeometry:", -[THGlossaryEntryFloatingInfo geometry](self, "geometry"));
  objc_msgSend(v4, "setOwningAttachment:", -[THGlossaryEntryFloatingInfo owningAttachment](self, "owningAttachment"));
  return v4;
}

- (id)copyWithContext:(id)a3
{
  return -[THGlossaryEntryFloatingInfo copyWithZone:](self, "copyWithZone:", 0);
}

- (TSDInfoGeometry)geometry
{
  return (TSDInfoGeometry *)objc_alloc_init((Class)TSDInfoGeometry);
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  if (a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryFloatingInfo setOwningAttachment:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryFloatingInfo.m"), 109, CFSTR("Glossary entries should not have an owning attachment."));
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (BOOL)floatingAboveText
{
  return 0;
}

- (BOOL)anchoredToText
{
  return 0;
}

- (BOOL)inlineWithText
{
  return 1;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THGlossaryEntryFloatingLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THGlossaryEntryFloatingRep, a2);
}

- (BOOL)isFloatingAboveText
{
  return -[THGlossaryEntryFloatingInfo owningAttachment](self, "owningAttachment") == 0;
}

- (BOOL)isAnchoredToText
{
  return -[TSDOwningAttachment isAnchored](-[THGlossaryEntryFloatingInfo owningAttachment](self, "owningAttachment"), "isAnchored");
}

- (BOOL)isInlineWithText
{
  if (-[THGlossaryEntryFloatingInfo isFloatingAboveText](self, "isFloatingAboveText"))
    return 0;
  else
    return !-[THGlossaryEntryFloatingInfo isAnchoredToText](self, "isAnchoredToText");
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  return -[THModelGlossaryEntryBody bodyFloatingInfos](-[THGlossaryEntryFloatingInfo body](self, "body"), "bodyFloatingInfos");
}

- (THModelGlossaryEntry)entry
{
  return self->mEntry;
}

- (TSDContainerInfo)parentInfo
{
  return self->mParentInfo;
}

- (void)setParentInfo:(id)a3
{
  self->mParentInfo = (TSDContainerInfo *)a3;
}

@end
