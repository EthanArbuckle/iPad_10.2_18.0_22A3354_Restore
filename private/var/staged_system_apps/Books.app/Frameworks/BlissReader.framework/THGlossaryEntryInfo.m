@implementation THGlossaryEntryInfo

- (THGlossaryEntryInfo)initWithEntry:(id)a3 body:(id)a4
{
  THGlossaryEntryInfo *v6;
  THGlossaryEntryInfo *v7;
  id v8;
  double v9;
  _QWORD v11[5];
  objc_super v12;
  _QWORD v13[2];

  v12.receiver = self;
  v12.super_class = (Class)THGlossaryEntryInfo;
  v6 = -[THGlossaryEntryInfo init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    v6->mEntry = (THModelGlossaryEntry *)a3;
    v6->mBody = (THModelGlossaryEntryFlushable *)a4;
    v8 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
    objc_msgSend(v8, "setObject:forProperty:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0), 18);
    objc_msgSend(v8, "setObject:forProperty:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 15.0), "fontName"), 16);
    LODWORD(v9) = 15.0;
    objc_msgSend(v8, "setFloatValue:forProperty:", 17, v9);
    v13[0] = -[THModelGlossaryEntryBody relatedTermsInfo](-[THGlossaryEntryInfo body](v7, "body"), "relatedTermsInfo");
    v13[1] = -[THModelGlossaryEntryBody linksInfo](-[THGlossaryEntryInfo body](v7, "body"), "linksInfo");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_B053C;
    v11[3] = &unk_428F00;
    v11[4] = v8;
    -[NSArray enumerateObjectsUsingBlock:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2), "enumerateObjectsUsingBlock:", v11);
    if (objc_msgSend(objc_msgSend(objc_msgSend(a4, "body"), "bodyFloatingInfos"), "count"))
      v7->mFloatingInfo = -[THGlossaryEntryFloatingInfo initWithEntry:body:]([THGlossaryEntryFloatingInfo alloc], "initWithEntry:body:", a3, a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->mChildInfos = 0;
  self->mFloatingInfo = 0;

  self->mBody = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryInfo;
  -[THGlossaryEntryInfo dealloc](&v3, "dealloc");
}

- (THModelGlossaryEntryBody)body
{
  return -[THModelGlossaryEntryFlushable body](self->mBody, "body");
}

- (BOOL)hasTitle
{
  THWPStorage *v3;

  v3 = -[THModelGlossaryEntryBody bodyStorage](-[THGlossaryEntryInfo body](self, "body"), "bodyStorage");
  if (v3)
    LOBYTE(v3) = -[THWPStorage length](-[THModelGlossaryEntryBody bodyStorage](-[THGlossaryEntryInfo body](self, "body"), "bodyStorage"), "length") != 0;
  return (char)v3;
}

- (THWPStorage)headerInfo
{
  return -[THModelGlossaryEntryBody headerInfo](-[THGlossaryEntryInfo body](self, "body"), "headerInfo");
}

- (THWPStorage)bodyStorage
{
  return -[THModelGlossaryEntryBody bodyStorage](-[THGlossaryEntryInfo body](self, "body"), "bodyStorage");
}

- (THWPStorage)relatedTermsInfo
{
  return -[THModelGlossaryEntryBody relatedTermsInfo](-[THGlossaryEntryInfo body](self, "body"), "relatedTermsInfo");
}

- (THWPStorage)linksInfo
{
  return -[THModelGlossaryEntryBody linksInfo](-[THGlossaryEntryInfo body](self, "body"), "linksInfo");
}

- (id)childCommandForReplaceAllCommand:(id)a3
{
  return 0;
}

- (id)childEnumerator
{
  return objc_msgSend(-[THGlossaryEntryInfo childInfos](self, "childInfos"), "objectEnumerator");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithEntry:body:", self->mEntry, self->mBody);
  objc_msgSend(v4, "setParentInfo:", -[THGlossaryEntryInfo parentInfo](self, "parentInfo"));
  objc_msgSend(v4, "setOwningAttachment:", -[THGlossaryEntryInfo owningAttachment](self, "owningAttachment"));
  return v4;
}

- (id)copyWithContext:(id)a3
{
  return -[THGlossaryEntryInfo copyWithZone:](self, "copyWithZone:", 0);
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
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryInfo setOwningAttachment:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryInfo.m"), 152, CFSTR("Glossary entries should not have an owning attachment."));
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
  return (Class)objc_opt_class(THGlossaryEntryLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THGlossaryEntryRep, a2);
}

- (BOOL)isFloatingAboveText
{
  return -[THGlossaryEntryInfo owningAttachment](self, "owningAttachment") == 0;
}

- (BOOL)isAnchoredToText
{
  return -[TSDOwningAttachment isAnchored](-[THGlossaryEntryInfo owningAttachment](self, "owningAttachment"), "isAnchored");
}

- (BOOL)isInlineWithText
{
  if (-[THGlossaryEntryInfo isFloatingAboveText](self, "isFloatingAboveText"))
    return 0;
  else
    return !-[THGlossaryEntryInfo isAnchoredToText](self, "isAnchoredToText");
}

- (BOOL)isThemeContent
{
  return 0;
}

- (id)childInfos
{
  THModelGlossaryEntryBody *v3;
  id result;
  id v5;

  v3 = -[THGlossaryEntryInfo body](self, "body");
  result = self->mChildInfos;
  if (!result)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)-[NSArray count](-[THModelGlossaryEntryBody bodyFloatingInfos](v3, "bodyFloatingInfos"), "count") + 4);
    if (-[THModelGlossaryEntryBody headerInfo](v3, "headerInfo"))
      objc_msgSend(v5, "addObject:", -[THModelGlossaryEntryBody headerInfo](v3, "headerInfo"));
    if (-[THGlossaryEntryInfo floatingInfo](self, "floatingInfo"))
      objc_msgSend(v5, "addObject:", -[THGlossaryEntryInfo floatingInfo](self, "floatingInfo"));
    if (-[THModelGlossaryEntryBody bodyStorage](v3, "bodyStorage"))
      objc_msgSend(v5, "addObject:", -[THModelGlossaryEntryBody bodyStorage](v3, "bodyStorage"));
    if (-[THModelGlossaryEntryBody relatedTermsInfo](v3, "relatedTermsInfo"))
      objc_msgSend(v5, "addObject:", -[THModelGlossaryEntryBody relatedTermsInfo](v3, "relatedTermsInfo"));
    if (-[THModelGlossaryEntryBody linksInfo](v3, "linksInfo"))
      objc_msgSend(v5, "addObject:", -[THModelGlossaryEntryBody linksInfo](v3, "linksInfo"));
    self->mChildInfos = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v5);

    return self->mChildInfos;
  }
  return result;
}

- (THModelGlossaryEntry)entry
{
  return self->mEntry;
}

- (THGlossaryEntryFloatingInfo)floatingInfo
{
  return self->mFloatingInfo;
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
