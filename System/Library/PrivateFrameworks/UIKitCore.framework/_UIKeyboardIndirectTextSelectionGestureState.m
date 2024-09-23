@implementation _UIKeyboardIndirectTextSelectionGestureState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIKeyboardIndirectTextSelectionGestureState)initWithCoder:(id)a3
{
  id v4;
  _UIKeyboardIndirectTextSelectionGestureState *v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardIndirectTextSelectionGestureState;
  v5 = -[_UIKeyboardIndirectTextSelectionGestureState init](&v9, sel_init);
  if (v5)
  {
    v5->_type = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("Type"));
    v5->_state = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("State"));
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("Translation"));
    v5->_translation.x = v6;
    v5->_translation.y = v7;
    v5->_flickDirection = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("FlickDirection"));
    v5->_isShiftKeyBeingHeld = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Shift"));
    v5->_touchCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("TouchCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t touchCount;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_type), CFSTR("Type"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_state), CFSTR("State"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("Translation"), self->_translation.x, self->_translation.y);
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_flickDirection), CFSTR("FlickDirection"));
  if (self->_isShiftKeyBeingHeld)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("Shift"));
  touchCount = self->_touchCount;
  if (touchCount)
    objc_msgSend(v5, "encodeInt:forKey:", touchCount, CFSTR("TouchCount"));

}

- (BOOL)isEqual:(id)a3
{
  _UIKeyboardIndirectTextSelectionGestureState *v4;
  _UIKeyboardIndirectTextSelectionGestureState *v5;
  int64_t v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  unint64_t v15;
  _BOOL4 v16;
  unint64_t v18;

  v4 = (_UIKeyboardIndirectTextSelectionGestureState *)a3;
  if (v4 == self)
  {
    v13 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  v6 = -[_UIKeyboardIndirectTextSelectionGestureState type](self, "type");
  if (v6 != -[_UIKeyboardIndirectTextSelectionGestureState type](v5, "type"))
    goto LABEL_9;
  v7 = -[_UIKeyboardIndirectTextSelectionGestureState state](self, "state");
  if (v7 != -[_UIKeyboardIndirectTextSelectionGestureState state](v5, "state"))
    goto LABEL_9;
  -[_UIKeyboardIndirectTextSelectionGestureState translation](self, "translation");
  v9 = v8;
  v11 = v10;
  -[_UIKeyboardIndirectTextSelectionGestureState translation](v5, "translation");
  v13 = 0;
  if (v9 != v14 || v11 != v12)
    goto LABEL_10;
  v15 = -[_UIKeyboardIndirectTextSelectionGestureState flickDirection](self, "flickDirection");
  if (v15 == -[_UIKeyboardIndirectTextSelectionGestureState flickDirection](v5, "flickDirection")
    && (v16 = -[_UIKeyboardIndirectTextSelectionGestureState isShiftKeyBeingHeld](self, "isShiftKeyBeingHeld"),
        v16 == -[_UIKeyboardIndirectTextSelectionGestureState isShiftKeyBeingHeld](v5, "isShiftKeyBeingHeld")))
  {
    v18 = -[_UIKeyboardIndirectTextSelectionGestureState touchCount](self, "touchCount");
    v13 = v18 == -[_UIKeyboardIndirectTextSelectionGestureState touchCount](v5, "touchCount");
  }
  else
  {
LABEL_9:
    v13 = 0;
  }
LABEL_10:

LABEL_13:
  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
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

- (unint64_t)flickDirection
{
  return self->_flickDirection;
}

- (void)setFlickDirection:(unint64_t)a3
{
  self->_flickDirection = a3;
}

- (BOOL)isShiftKeyBeingHeld
{
  return self->_isShiftKeyBeingHeld;
}

- (void)setIsShiftKeyBeingHeld:(BOOL)a3
{
  self->_isShiftKeyBeingHeld = a3;
}

- (unint64_t)touchCount
{
  return self->_touchCount;
}

- (void)setTouchCount:(unint64_t)a3
{
  self->_touchCount = a3;
}

@end
