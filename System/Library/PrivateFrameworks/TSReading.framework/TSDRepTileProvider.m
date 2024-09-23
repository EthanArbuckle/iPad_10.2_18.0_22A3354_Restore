@implementation TSDRepTileProvider

- (TSDRepTileProvider)initWithRep:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "interactiveCanvasController");
  return -[TSDTileProvider initWithTarget:queue:storage:accessController:](self, "initWithTarget:queue:storage:accessController:", a3, objc_msgSend(a3, "i_queueForTileProvider"), objc_msgSend(v5, "i_tileStorage"), objc_msgSend(v5, "accessController"));
}

- (BOOL)isTargetOpaque
{
  return -[NSObject isOpaque](self->super.mTarget, "isOpaque");
}

- (BOOL)canTargetDrawInParallel
{
  return -[NSObject canDrawInParallel](self->super.mTarget, "canDrawInParallel");
}

- (void)drawTargetInLayer:(id)a3 context:(CGContext *)a4
{
  objc_msgSend((id)-[NSObject interactiveCanvasController](self->super.mTarget, "interactiveCanvasController"), "i_drawRepWithReadLock:inContext:forLayer:", self->super.mTarget, a4, a3);
}

- (void)beginDrawingOperation
{
  -[NSObject beginDrawingOperation](self->super.mTarget, "beginDrawingOperation");
}

- (void)endDrawingOperation
{
  -[NSObject endDrawingOperation](self->super.mTarget, "endDrawingOperation");
}

@end
