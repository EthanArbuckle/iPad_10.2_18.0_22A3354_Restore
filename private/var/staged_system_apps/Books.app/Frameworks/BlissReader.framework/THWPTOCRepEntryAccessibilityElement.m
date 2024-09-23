@implementation THWPTOCRepEntryAccessibilityElement

- (THWPTOCRepEntryAccessibilityElement)initWithParentTOCRep:(id)a3 linkField:(id)a4 textRange:(_NSRange)a5 indexInTOC:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  THWPTOCRepEntryAccessibilityElement *v11;
  THWPTOCRepEntryAccessibilityElement *v12;

  length = a5.length;
  location = a5.location;
  v11 = -[THWPTOCRepEntryAccessibilityElement initWithAccessibilityContainer:](self, "initWithAccessibilityContainer:");
  v12 = v11;
  if (v11)
  {
    v11->_parentTOCRep = (THWPTOCRepAccessibility *)a3;
    v11->_linkField = (TSWPHyperlinkFieldAccessibility *)a4;
    v12->_textRange.location = location;
    v12->_textRange.length = length;
    v12->_index = a6;
  }
  return v12;
}

- (id)accessibilityValue
{
  THTOCTileModelEntryAccessibility *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[THWPTOCRepEntryAccessibilityElement tileModelEntry](self, "tileModelEntry");
  v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("toc.entry.section.number.format %@")), -[THTOCTileModelEntryAccessibility thaxSectionIdentifier](v2, "thaxSectionIdentifier"));
  v4 = -[THTOCTileModelEntryAccessibility thaxTitle](v2, "thaxTitle");
  +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("page.number %@")), -[THTOCTileModelEntryAccessibility thaxDisplayPageNumber](v2, "thaxDisplayPageNumber"));
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (BOOL)accessibilityActivate
{
  THChapterBrowserControllerAccessibility *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = -[THWPTOCRepAccessibility thaxChapterBrowserController](-[THWPTOCRepEntryAccessibilityElement parentTOCRep](self, "parentTOCRep"), "thaxChapterBrowserController");
  if (v3)
  {
    -[THChapterBrowserControllerAccessibility thaxFollowLink:](v3, "thaxFollowLink:", +[THModelLinkAccessibility thaxModelLinkForHyperlinkField:](THModelLinkAccessibility, "thaxModelLinkForHyperlinkField:", -[THWPTOCRepEntryAccessibilityElement linkField](self, "linkField")));
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Couldn't find chapter browser controller, won't be able to follow link"), v5, v6, v7, v8, v9, v11))abort();
  }
  return v3 != 0;
}

- (CGRect)accessibilityFrame
{
  THWPTOCRepAccessibility *v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v3 = -[THWPTOCRepEntryAccessibilityElement parentTOCRep](self, "parentTOCRep");
  v4 = -[THWPTOCRepEntryAccessibilityElement textRange](self, "textRange");
  -[TSWPRepAccessibility _accessibilityBoundsForRange:](v3, "_accessibilityBoundsForRange:", v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (THTOCTileModelEntryAccessibility)tileModelEntry
{
  void *v3;
  THTOCTileModelEntryAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTOCTileModelEntryAccessibility);
  result = (THTOCTileModelEntryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[NSArray objectAtIndexedSubscript:](-[THTOCTileModelAccessibility thaxLandscapeEntries](-[THWPTOCRepAccessibility thaxTileModel](-[THWPTOCRepEntryAccessibilityElement parentTOCRep](self, "parentTOCRep"), "thaxTileModel"), "thaxLandscapeEntries"), "objectAtIndexedSubscript:", -[THWPTOCRepEntryAccessibilityElement index](self, "index")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPTOCRepEntryAccessibilityElement;
  -[THWPTOCRepEntryAccessibilityElement dealloc](&v3, "dealloc");
}

- (THWPTOCRepAccessibility)parentTOCRep
{
  return self->_parentTOCRep;
}

- (void)setParentTOCRep:(id)a3
{
  self->_parentTOCRep = (THWPTOCRepAccessibility *)a3;
}

- (TSWPHyperlinkFieldAccessibility)linkField
{
  return self->_linkField;
}

- (_NSRange)textRange
{
  _NSRange *p_textRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_textRange = &self->_textRange;
  location = self->_textRange.location;
  length = p_textRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
