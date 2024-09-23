@implementation SHSheetDraggingEvent

+ (id)eventForDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y;
  double x;
  _BOOL8 v7;
  SHSheetDraggingEvent *v9;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  v9 = objc_alloc_init(SHSheetDraggingEvent);
  -[SHSheetDraggingEvent setType:](v9, "setType:", 0);
  -[SHSheetDraggingEvent setRubberBandCoefficient:](v9, "setRubberBandCoefficient:", a3);
  -[SHSheetDraggingEvent setDismissible:](v9, "setDismissible:", v7);
  -[SHSheetDraggingEvent setInterruptedOffset:](v9, "setInterruptedOffset:", x, y);
  return v9;
}

+ (id)eventForDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  SHSheetDraggingEvent *v12;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v12 = objc_alloc_init(SHSheetDraggingEvent);
  -[SHSheetDraggingEvent setType:](v12, "setType:", 1);
  -[SHSheetDraggingEvent setTranslation:](v12, "setTranslation:", v11, v10);
  -[SHSheetDraggingEvent setVelocity:](v12, "setVelocity:", x, y);
  -[SHSheetDraggingEvent setShouldAnimate:](v12, "setShouldAnimate:", v7);
  -[SHSheetDraggingEvent setDismissible:](v12, "setDismissible:", v6);
  return v12;
}

+ (id)eventForDraggingDidEnd
{
  SHSheetDraggingEvent *v2;

  v2 = objc_alloc_init(SHSheetDraggingEvent);
  -[SHSheetDraggingEvent setType:](v2, "setType:", 2);
  return v2;
}

- (SHSheetDraggingEvent)initWithBSXPCCoder:(id)a3
{
  id v4;
  SHSheetDraggingEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SHSheetDraggingEvent;
  v5 = -[SHSheetDraggingEvent init](&v7, sel_init);
  if (v5)
  {
    -[SHSheetDraggingEvent setType:](v5, "setType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rubberBandCoefficient"));
    -[SHSheetDraggingEvent setRubberBandCoefficient:](v5, "setRubberBandCoefficient:");
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("interruptedOffset"));
    -[SHSheetDraggingEvent setInterruptedOffset:](v5, "setInterruptedOffset:");
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("translation"));
    -[SHSheetDraggingEvent setTranslation:](v5, "setTranslation:");
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("velocity"));
    -[SHSheetDraggingEvent setVelocity:](v5, "setVelocity:");
    -[SHSheetDraggingEvent setDismissible:](v5, "setDismissible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dismissible")));
    -[SHSheetDraggingEvent setShouldAnimate:](v5, "setShouldAnimate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAnimate")));
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SHSheetDraggingEvent type](self, "type"), CFSTR("type"));
  -[SHSheetDraggingEvent rubberBandCoefficient](self, "rubberBandCoefficient");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rubberBandCoefficient"));
  -[SHSheetDraggingEvent interruptedOffset](self, "interruptedOffset");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("interruptedOffset"));
  -[SHSheetDraggingEvent translation](self, "translation");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("translation"));
  -[SHSheetDraggingEvent velocity](self, "velocity");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("velocity"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SHSheetDraggingEvent dismissible](self, "dismissible"), CFSTR("dismissible"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SHSheetDraggingEvent shouldAnimate](self, "shouldAnimate"), CFSTR("shouldAnimate"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)rubberBandCoefficient
{
  return self->_rubberBandCoefficient;
}

- (void)setRubberBandCoefficient:(double)a3
{
  self->_rubberBandCoefficient = a3;
}

- (CGPoint)interruptedOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_interruptedOffset.x;
  y = self->_interruptedOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInterruptedOffset:(CGPoint)a3
{
  self->_interruptedOffset = a3;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (CGPoint)velocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_velocity.x;
  y = self->_velocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVelocity:(CGPoint)a3
{
  self->_velocity = a3;
}

- (BOOL)dismissible
{
  return self->_dismissible;
}

- (void)setDismissible:(BOOL)a3
{
  self->_dismissible = a3;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

@end
