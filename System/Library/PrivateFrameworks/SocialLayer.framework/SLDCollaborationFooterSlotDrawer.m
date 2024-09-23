@implementation SLDCollaborationFooterSlotDrawer

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SLDCollaborationFooterDrawing *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SLDCollaborationFooterDrawing initWithStyle:tag:forRemote:]([SLDCollaborationFooterDrawing alloc], "initWithStyle:tag:forRemote:", v8, v7, v5);

  return v9;
}

@end
