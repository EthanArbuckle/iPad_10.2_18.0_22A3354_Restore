@implementation PBPasteButtonTag

+ (id)calloutBarPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 titleWidth:(double)a6 contentScaleLevel:(unint64_t)a7
{
  return -[PBCalloutBarPasteButtonTag initWithSecureName:size:titleOrigin:titleWidth:contentScaleLevel:]([PBCalloutBarPasteButtonTag alloc], "initWithSecureName:size:titleOrigin:titleWidth:contentScaleLevel:", *(_QWORD *)&a3, a7, a4.width, a4.height, a5.x, a5.y, a6);
}

+ (id)systemInputAssistantPasteButtonTagWithSite:(int64_t)a3
{
  return -[PBSystemInputAssistantPasteButtonTag initWithSite:]([PBSystemInputAssistantPasteButtonTag alloc], "initWithSite:", a3);
}

+ (id)undoInteractionHUDIconPasteButtonTagWithMinWidth:(double)a3
{
  return -[PBUndoInteractionHUDIconPasteButtonTag initWithMinWidth:]([PBUndoInteractionHUDIconPasteButtonTag alloc], "initWithMinWidth:", a3);
}

+ (id)undoInteractionHUDTextPasteButtonTagWithMinWidth:(double)a3
{
  return -[PBUndoInteractionHUDTextPasteButtonTag initWithMinWidth:]([PBUndoInteractionHUDTextPasteButtonTag alloc], "initWithMinWidth:", a3);
}

+ (id)contextMenuPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 titleOrigin:(CGPoint)a5 layoutSize:(int64_t)a6 hasTrailingGutter:(BOOL)a7
{
  return -[PBContextMenuPasteButtonTag initWithSecureName:size:titleOrigin:layoutSize:hasTrailingGutter:]([PBContextMenuPasteButtonTag alloc], "initWithSecureName:size:titleOrigin:layoutSize:hasTrailingGutter:", *(_QWORD *)&a3, a6, a7, a4.width, a4.height, a5.x, a5.y);
}

+ (id)editMenuPasteButtonTagWithSecureName:(unsigned int)a3 size:(CGSize)a4 contentOrigin:(CGPoint)a5 displayMode:(unint64_t)a6
{
  return -[PBEditMenuPasteButtonTag initWithSecureName:size:contentOrigin:displayMode:]([PBEditMenuPasteButtonTag alloc], "initWithSecureName:size:contentOrigin:displayMode:", *(_QWORD *)&a3, a6, a4.width, a4.height, a5.x, a5.y);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBPasteButtonTag)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBPasteButtonTag;
  return -[PBPasteButtonTag init](&v4, sel_init, a3);
}

- (float)backgroundStatisticsPassingContrastForStyle:(id)a3
{
  return 3.1;
}

- (float)backgroundStatisticsFailingContrastForStyle:(id)a3
{
  return 2.9;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return -513;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 62;
}

- (CGColor)baseForegroundColorForStyle:(id)a3
{
  uint64_t v3;
  CFStringRef *v4;

  v3 = objc_msgSend(a3, "userInterfaceStyle");
  if (!v3)
  {
    v4 = (CFStringRef *)MEMORY[0x1E0C9D8E0];
    return CGColorGetConstantColor(*v4);
  }
  if (v3 == 1)
  {
    v4 = (CFStringRef *)MEMORY[0x1E0C9DA30];
    return CGColorGetConstantColor(*v4);
  }
  return 0;
}

- (id)_acceptCalloutBarPasteButtonTagVisit:(id)a3 systemInputAssistantPasteButtonTagVisit:(id)a4 undoInteractionHUDIconPasteButtonTagVisit:(id)a5 undoInteractionHUDTextPasteButtonTagVisit:(id)a6 contextMenuPasteButtonTagVisit:(id)a7 editMenuPasteButtonTagVisit:(id)a8
{
  return 0;
}

@end
