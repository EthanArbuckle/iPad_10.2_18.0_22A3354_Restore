@implementation TSDAllTouchesDoneGestureRecognizer

- (TSDAllTouchesDoneGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  TSDAllTouchesDoneGestureRecognizer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDAllTouchesDoneGestureRecognizer;
  v4 = -[TSDAllTouchesDoneGestureRecognizer initWithTarget:action:](&v6, sel_initWithTarget_action_, a3, a4);
  if (v4)
    v4->mTouches = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDAllTouchesDoneGestureRecognizer;
  -[TSDAllTouchesDoneGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDAllTouchesDoneGestureRecognizer;
  -[TSDAllTouchesDoneGestureRecognizer reset](&v3, sel_reset);
  -[NSMutableSet removeAllObjects](self->mTouches, "removeAllObjects");
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(a3, "view"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet unionSet:](self->mTouches, "unionSet:", a3, a4);
}

- (void)p_touchesEndedOrCancelled:(id)a3
{
  -[NSMutableSet minusSet:](self->mTouches, "minusSet:", a3);
  if (!-[NSMutableSet count](self->mTouches, "count") && !-[TSDAllTouchesDoneGestureRecognizer state](self, "state"))
    -[TSDAllTouchesDoneGestureRecognizer setState:](self, "setState:", 3);
}

@end
