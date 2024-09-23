@implementation THWPLayout

- (void)willBeAddedToLayoutController:(id)a3
{
  id v4;

  v4 = -[THWPLayout info](self, "info", a3);
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THWPLayout sectionLayout](self, "sectionLayout"), "info"), "pageController"), "needsAnnotationSourceForLayout:", self))objc_msgSend(v4, "updateAnnotationSourceWithContentNode:", objc_msgSend(objc_msgSend(-[THWPLayout sectionLayout](self, "sectionLayout"), "info"), "contentNode"));
}

@end
