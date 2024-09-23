@implementation THFlowSectionInfo

- (id)childInfos
{
  id v3;

  if (!-[THSectionInfo contentNode](self, "contentNode"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionInfo childInfos]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionInfo.mm"), 21, CFSTR("invalid nil value for '%s'"), "self.contentNode");
  if (!-[THFlowSectionInfo presentationType](self, "presentationType"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionInfo childInfos]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionInfo.mm"), 22, CFSTR("invalid nil value for '%s'"), "self.presentationType");
  if (!-[THSectionInfo pages](self, "pages"))
  {
    v3 = -[THModelContentNode pageAtRelativeIndex:forPresentationType:](-[THSectionInfo contentNode](self, "contentNode"), "pageAtRelativeIndex:forPresentationType:", 0, -[THFlowSectionInfo presentationType](self, "presentationType"));
    if (v3)
      -[THSectionInfo setPages:](self, "setPages:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v3));
    else
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionInfo childInfos]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionInfo.mm"), 27, CFSTR("invalid nil value for '%s'"), "pageInfo");
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[THSectionInfo pages](self, "pages"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowSectionInfo;
  -[THSectionInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THFlowSectionLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THFlowSectionRep, a2);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
