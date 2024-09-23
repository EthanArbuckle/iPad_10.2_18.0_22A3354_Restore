@implementation TSWPFootnoteReferenceAttachment

- (TSWPFootnoteReferenceAttachment)initWithContext:(id)a3 wpStorage:(id)a4
{
  TSWPFootnoteReferenceAttachment *v5;
  TSWPFootnoteReferenceAttachment *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPFootnoteReferenceAttachment;
  v5 = -[TSWPAttachment initWithContext:](&v10, sel_initWithContext_, a3);
  v6 = v5;
  if (v5)
  {
    -[TSWPFootnoteReferenceAttachment setContainedStorage:](v5, "setContainedStorage:", a4);
    if (!v6->_containedStorage)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFootnoteReferenceAttachment initWithContext:wpStorage:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFootnoteReferenceAttachment.mm"), 73, CFSTR("invalid nil value for '%s'"), "_containedStorage");
    }
  }
  return v6;
}

- (TSWPFootnoteReferenceAttachment)initWithContext:(id)a3
{
  void *v5;
  void *v6;
  TSWPStorage *v7;
  TSWPFootnoteReferenceAttachment *v8;
  uint64_t v10;

  v5 = (void *)objc_msgSend(a3, "documentRoot");
  v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "theme"), "defaultParagraphStyle");
  LODWORD(v10) = -1;
  v7 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", a3, 0, 2, objc_msgSend(v5, "stylesheet"), v6, objc_msgSend(v6, "initialListStyle"), 0, 0, v10);
  v8 = -[TSWPFootnoteReferenceAttachment initWithContext:wpStorage:](self, "initWithContext:wpStorage:", a3, v7);
  -[TSWPFootnoteReferenceAttachment applyMark](v8, "applyMark");

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPStorage setOwningAttachment:](self->_containedStorage, "setOwningAttachment:", 0);
  -[TSWPStorage setParentInfo:](self->_containedStorage, "setParentInfo:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPFootnoteReferenceAttachment dealloc](&v3, sel_dealloc);
}

- (void)applyMark
{
  TSWPFootnoteMarkAttachment *v3;

  if (-[TSPObject context](self, "context"))
    -[TSPObject willModify](self, "willModify");
  v3 = -[TSWPAttachment initWithContext:]([TSWPFootnoteMarkAttachment alloc], "initWithContext:", -[TSPObject context](self, "context"));
  -[TSWPStorage insertAttachmentOrFootnote:range:](-[TSWPFootnoteReferenceAttachment containedStorage](self, "containedStorage"), "insertAttachmentOrFootnote:range:", v3, 0, 0);

}

- (int)elementKind
{
  return 64;
}

- (BOOL)isEqual:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *customMarkString;
  NSString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPFootnoteReferenceAttachment;
  LODWORD(v4) = -[TSWPAttachment isEqual:](&v9, sel_isEqual_);
  if ((_DWORD)v4)
  {
    objc_opt_class();
    v4 = (NSString *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      LODWORD(v4) = -[TSWPStorage isEqual:](self->_containedStorage, "isEqual:", -[NSString containedStorage](v4, "containedStorage"));
      if ((_DWORD)v4)
      {
        v4 = (NSString *)-[NSString customMarkString](v5, "customMarkString");
        customMarkString = self->_customMarkString;
        if (v4 == customMarkString)
        {
          LOBYTE(v4) = 1;
        }
        else
        {
          v7 = v4;
          LOBYTE(v4) = 0;
          if (v7 && customMarkString)
            LOBYTE(v4) = -[NSString isEqualToString:](self->_customMarkString, "isEqualToString:");
        }
      }
    }
  }
  return (char)v4;
}

- (id)copyWithContext:(id)a3
{
  id v5;
  void *v6;

  v5 = -[TSWPStorage newSubstorageWithRange:context:flags:](self->_containedStorage, "newSubstorageWithRange:context:flags:", 0, -[TSWPStorage length](self->_containedStorage, "length"), a3, 1);
  v6 = (void *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithContext:wpStorage:", a3, v5);

  objc_msgSend(v6, "setCustomMarkString:", -[TSWPFootnoteReferenceAttachment customMarkString](self, "customMarkString"));
  return v6;
}

- (void)setContainedStorageParentInfoToStorage:(id)a3
{
  -[TSWPStorage setParentInfo:](self->_containedStorage, "setParentInfo:", a3);
}

- (void)setContainedStorage:(id)a3
{
  id v5;

  if (self->_containedStorage != a3)
  {
    if (-[TSPObject context](self, "context"))
      -[TSPObject willModify](self, "willModify");
    -[TSWPStorage setOwningAttachment:](self->_containedStorage, "setOwningAttachment:", 0);
    -[TSWPStorage setParentInfo:](self->_containedStorage, "setParentInfo:", 0);
    v5 = a3;

    self->_containedStorage = (TSWPStorage *)a3;
    objc_msgSend(a3, "setOwningAttachment:", self);
    -[TSWPFootnoteReferenceAttachment setContainedStorageParentInfoToStorage:](self, "setContainedStorageParentInfoToStorage:", self->super.super._parentStorage);
  }
}

- (void)setParentStorage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment setParentStorage:](&v5, sel_setParentStorage_);
  -[TSWPFootnoteReferenceAttachment setContainedStorageParentInfoToStorage:](self, "setContainedStorageParentInfoToStorage:", a3);
}

- (void)setCustomMarkString:(id)a3
{
  id v5;

  if (-[TSPObject context](self, "context"))
    -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_customMarkString = (NSString *)a3;
}

- (unint64_t)findCharIndex
{
  return -[TSWPStorage findCharIndexForFootnoteAttachment:](self->super.super._parentStorage, "findCharIndexForFootnoteAttachment:", self);
}

- (id)stringEquivalent
{
  return 0;
}

- (BOOL)isSearchable
{
  return 1;
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment willBeAddedToDocumentRoot:context:](&v7, sel_willBeAddedToDocumentRoot_context_);
  -[TSWPStorage willBeAddedToDocumentRoot:dolcContext:](-[TSWPFootnoteReferenceAttachment containedStorage](self, "containedStorage"), "willBeAddedToDocumentRoot:dolcContext:", a3, a4);
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment wasAddedToDocumentRoot:context:](&v7, sel_wasAddedToDocumentRoot_context_);
  -[TSWPStorage wasAddedToDocumentRoot:dolcContext:](-[TSWPFootnoteReferenceAttachment containedStorage](self, "containedStorage"), "wasAddedToDocumentRoot:dolcContext:", a3, a4);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment willBeRemovedFromDocumentRoot:](&v5, sel_willBeRemovedFromDocumentRoot_);
  -[TSWPStorage willBeRemovedFromDocumentRoot:](-[TSWPFootnoteReferenceAttachment containedStorage](self, "containedStorage"), "willBeRemovedFromDocumentRoot:", a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment wasRemovedFromDocumentRoot:](&v5, sel_wasRemovedFromDocumentRoot_);
  -[TSWPStorage wasRemovedFromDocumentRoot:](-[TSWPFootnoteReferenceAttachment containedStorage](self, "containedStorage"), "wasRemovedFromDocumentRoot:", a3);
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  objc_super v7;

  objc_msgSend(a4, "pushMappingContext:", self);
  v7.receiver = self;
  v7.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment adoptStylesheet:withMapper:](&v7, sel_adoptStylesheet_withMapper_, a3, a4);
  -[TSWPStorage adoptStylesheet:withMapper:](self->_containedStorage, "adoptStylesheet:withMapper:", a3, a4);
  objc_msgSend(a4, "popMappingContext:", self);
}

- (void)checkDebug
{
  TSWPStorage *parentStorage;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  parentStorage = self->super.super._parentStorage;
  if (parentStorage
    && -[TSWPStorage findCharIndexForFootnoteAttachment:](parentStorage, "findCharIndexForFootnoteAttachment:", self) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFootnoteReferenceAttachment checkDebug]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFootnoteReferenceAttachment.mm"), 270, CFSTR("Attachment not found in parent storage"));
  }
  if (!self->_containedStorage)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFootnoteReferenceAttachment checkDebug]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFootnoteReferenceAttachment.mm"), 272, CFSTR("invalid nil value for '%s'"), "_containedStorage");
  }
}

- (NSString)customMarkString
{
  return self->_customMarkString;
}

- (TSWPStorage)containedStorage
{
  return self->_containedStorage;
}

@end
